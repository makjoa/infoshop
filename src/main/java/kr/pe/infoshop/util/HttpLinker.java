package kr.pe.infoshop.util;

public class HttpLinker {

	/**
	 * url ��ũ�� �� �ҽ��� ��ȯ�Ѵ�.
	 * 
	 * @param source
	 * @return
	 */
	public static String getLinkedSource(String source) {
		int lastIdxStart = 0;
		String pre = source;
		String output = "";
		while ((lastIdxStart = getLastIndexOfLink(source)) > -1) {
			if (lastIdxStart == -1) {
				return source;
			}
			int lastIdxEndTag = source.indexOf("<", lastIdxStart);
			int lastIdxEnd = source.indexOf(" ", lastIdxStart);
			if (lastIdxEnd == -1) {
				lastIdxEnd = source.indexOf("\n", lastIdxStart);
			} 
			if (source.indexOf(")", lastIdxStart) > -1 ) {
				lastIdxEnd = source.indexOf(")", lastIdxStart);
			}
			if (lastIdxEnd != -1 && lastIdxEndTag != -1) {
				lastIdxEnd = Math.min(lastIdxEnd, lastIdxEndTag);
			}
			if (lastIdxEnd == -1) {
				lastIdxEnd = source.length();
			}
			String lowerCase = source.toLowerCase();
			boolean hasLink = lowerCase.indexOf("</a>", lastIdxStart) != -1;
			boolean hasIframe = lowerCase.indexOf("</iframe>", lastIdxStart) != -1;
			boolean hasEmbed = lowerCase.indexOf("</embed>", lastIdxStart) != -1;
			int imgLastIndexOf = lowerCase.lastIndexOf("<img", lastIdxStart);
			boolean hasImgWithHttp = imgLastIndexOf != -1;
			if (hasImgWithHttp) {
				String imgTag = source.substring(imgLastIndexOf, source.indexOf('>', imgLastIndexOf));
				hasImgWithHttp = imgTag.indexOf("http") > -1;
			}
			if (hasLink) {
				String tag = "a";
				int lastIndexOf = lowerCase.lastIndexOf("<" + tag + " ");
				if (lastIndexOf == -1) {
					lastIndexOf = source.indexOf("</"+tag+">");
				}
				pre = source.substring(0, lastIndexOf);
				output = source.substring(lastIndexOf) + output;
				source = pre;

			} else if (hasIframe) {
				String tag = "iframe";
				int lastIndexOf = lowerCase.lastIndexOf("<" + tag + " ");
				pre = source.substring(0, lastIndexOf);
				output = source.substring(lastIndexOf) + output;
				source = pre;

			} else if (hasEmbed) {
				String tag = "embed";
				int lastIndexOf = lowerCase.lastIndexOf("<" + tag + " ");
				pre = source.substring(0, lastIndexOf);
				output = source.substring(lastIndexOf) + output;
				source = pre;
				
			} else if (hasImgWithHttp) {
				String tag = "img";
				int lastIndexOf = lowerCase.lastIndexOf("<" + tag + " ");
				pre = source.substring(0, lastIndexOf);
				output = source.substring(lastIndexOf) + output;
				source = pre;
				
			} else {
				String url = source.substring(lastIdxStart, lastIdxEnd);
				if(url.length() != url.trim().length()) {
					url = url.trim();
					lastIdxEnd = lastIdxEnd - 1;
				}
				int tagIdx = url.indexOf("<");
				if (tagIdx != -1) {
					lastIdxEnd -= url.length() - tagIdx;
					url = url.substring(0, tagIdx);
				}
				pre = source.substring(0, lastIdxStart);
				String post = source.substring(lastIdxEnd);

				output = "<a href=\"" + url + "\" target=\"_blank\">" + url
						+ "</a>" + post + output;
				source = pre;
			}
		}
		return pre + output;
	}

	private static int getLastIndexOfLink(String source) {
		int lastIndexOf = source.toLowerCase().lastIndexOf("http");
		return lastIndexOf;
	}
}