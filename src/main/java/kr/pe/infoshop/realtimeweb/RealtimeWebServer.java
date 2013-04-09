package kr.pe.infoshop.realtimeweb;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Component;
import org.vertx.java.core.Handler;
import org.vertx.java.core.SimpleHandler;
import org.vertx.java.core.Vertx;
import org.vertx.java.core.buffer.Buffer;
import org.vertx.java.core.http.HttpServer;
import org.vertx.java.core.json.JsonObject;
import org.vertx.java.core.sockjs.SockJSServer;
import org.vertx.java.core.sockjs.SockJSSocket;

/**
 * @author 심영재
 */
@Component
public class RealtimeWebServer {
	
	private static final HashMap<String, HashMap<String, List<SockJSSocket>>> SOCKET_MAP = new HashMap<>();
	private static final int PORT = 9090;
	
	static {
		
		Vertx vertx = Vertx.newVertx();
		HttpServer server = vertx.createHttpServer();
		SockJSServer sockJSServer = vertx.createSockJSServer(server);
		JsonObject config = new JsonObject().putString("prefix", "/r");
		sockJSServer.installApp(config, new Handler<SockJSSocket>() {
			@Override
			public void handle(final SockJSSocket sock) {

				// 접속
				sock.dataHandler(new Handler<Buffer>() {
					public void handle(Buffer buffer) {
						
						JsonObject json = new JsonObject(buffer.toString());
						String namespace = json.getString("namespace");
						String id = json.getString("id");
						
						HashMap<String, List<SockJSSocket>> map = SOCKET_MAP.get(namespace);
						if (map == null) {
							map = new HashMap<>();
							SOCKET_MAP.put(namespace, map);
						}
						List<SockJSSocket> sockets = map.get(id);
						if (sockets == null) {
							sockets = new ArrayList<>();
							map.put(id, sockets);
						}
						sockets.add(sock);
						
						System.out.println("=== RealtimeWeb Server Connected(" + namespace + "." + id + ":" + sock + ") ===");
						
					}
				});

				// 연결 해제
				sock.endHandler(new Handler<Void>() {
					@Override
					public void handle(Void v) {
						
						for (String namespace : SOCKET_MAP.keySet()) {
							HashMap<String, List<SockJSSocket>> map = SOCKET_MAP.get(namespace);
							if (map != null) {
								for (String id : map.keySet()) {
									List<SockJSSocket> sockets = map.get(id);
									if (sockets != null) {
										for (SockJSSocket _sock : sockets) {
											if (_sock.equals(sock)) {
												sockets.remove(sock);
												System.out.println("=== RealtimeWeb Server Disconnected(" + namespace + "." + id + ":" + sock + ") ===");
												
												if (sockets.size() == 0) {
													map.remove(sockets);
													if (map.size() == 0) {
														SOCKET_MAP.remove(map);
													}
												}
												
												break;
											}
										}
									}
								}
							}
						}
						
					}
				});
			}
		});
		server.listen(PORT);
		
		System.out.println("=== RealtimeWeb Server Running...(port:" + PORT + ") ===");
		
	}
	
	private static final ObjectMapper mapper = new ObjectMapper();

	public static boolean send(String namespace, String id, String handlerName, Object object) {
		if (SOCKET_MAP.get(namespace) != null && SOCKET_MAP.get(namespace).get(id) != null) {
			
			HashMap<String, Object> data = new HashMap<>();
			data.put("namespace", namespace);
			data.put("id", id);
			data.put("handlerName", handlerName);
			data.put("object", object);
			
			StringWriter writer = new StringWriter();
			try {
				mapper.writeValue(writer, data);
			} catch (IOException e) {
				e.printStackTrace();
			}
			String json = writer.toString();
		
			for (final SockJSSocket sock : SOCKET_MAP.get(namespace).get(id)) {
				if (!sock.writeQueueFull()) {
					sock.writeBuffer(new Buffer(json));
				} else {
					sock.pause();
					sock.drainHandler(new SimpleHandler() {
						public void handle() {
							sock.resume();
						}
					});
				}
			}
			return true;
		}
		return false;
	}

}
