package cn.stylefeng.guns.core.util;

import org.springframework.stereotype.Component;
import org.wltea.analyzer.core.IKSegmenter;
import org.wltea.analyzer.core.Lexeme;

import javax.annotation.PostConstruct;
import java.io.*;
import java.util.*;

/**
 * 敏感词处理工具 - IKAnalyzer中文分词工具 - 借助分词进行敏感词过滤
 *
 */
//@Component
public class SensitiveWordUtil {

    /**
     * 敏感词集合
     */
    public static HashMap sensitiveWordMap = new HashMap();

    /**
     * 初始化敏感词库
     */
    //@PostConstruct
    public static synchronized void init() throws IOException {
        //初始化敏感词容器，减少扩容操作
        SensitiveWordUtil instance = new SensitiveWordUtil();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(instance.getClass().getClassLoader().getResourceAsStream("keyWords.txt")));
        String str = null;
        while((str = bufferedReader.readLine()) != null)
        {
            sensitiveWordMap.put(str,str);
        }
        bufferedReader.close();
    }

    /**
     * 判断文字是否包含敏感字符
     *
     * @param txt 文字
     * @return 若包含返回true，否则返回false
     */
    public static boolean contains(String txt) throws Exception {
        boolean flag = false;
        List<String> wordList = segment(txt);
        for (String word : wordList) {
            if (sensitiveWordMap.get(word) != null) {
                return true;
            }
        }
        return flag;
    }

    /**
     * 获取文字中的敏感词
     *
     * @param txt 文字
     * @return
     */
    public static Set<String> getSensitiveWord(String txt) throws IOException {
        Set<String> sensitiveWordList = new HashSet<>();

        List<String> wordList = segment(txt);
        for (String word : wordList) {
            if (sensitiveWordMap.get(word) != null) {
                sensitiveWordList.add(word);
            }
        }
        return sensitiveWordList;
    }

    /**
     * 替换敏感字字符
     *
     * @param txt         文本
     * @param replaceChar 替换的字符，匹配的敏感词以字符逐个替换，如 语句：我爱中国人 敏感词：中国人，替换字符：*， 替换结果：我爱***
     * @return
     */
    public static String replaceSensitiveWord(String txt, char replaceChar) throws IOException {
        String resultTxt = txt;
        //获取所有的敏感词
        Set<String> sensitiveWordList = getSensitiveWord(txt);
        String replaceString;
        for (String sensitiveWord : sensitiveWordList) {
            replaceString = getReplaceChars(replaceChar, sensitiveWord.length());
            resultTxt = resultTxt.replaceAll(sensitiveWord, replaceString);
        }
        return resultTxt;
    }

    /**
     * 替换敏感字字符
     *
     * @param txt        文本
     * @param replaceStr 替换的字符串，匹配的敏感词以字符逐个替换，如 语句：我爱中国人 敏感词：中国人，替换字符串：[屏蔽]，替换结果：我爱[屏蔽]
     * @return
     */
    public static String replaceSensitiveWord(String txt, String replaceStr) throws IOException {
        String resultTxt = txt;
        //获取所有的敏感词
        Set<String> sensitiveWordList = getSensitiveWord(txt);
        for (String sensitiveWord : sensitiveWordList) {
            resultTxt = resultTxt.replaceAll(sensitiveWord, replaceStr);
        }
        return resultTxt;
    }

    /**
     * 获取替换字符串
     *
     * @param replaceChar
     * @param length
     * @return
     */
    private static String getReplaceChars(char replaceChar, int length) {
        String resultReplace = String.valueOf(replaceChar);
        for (int i = 1; i < length; i++) {
            resultReplace += replaceChar;
        }

        return resultReplace;
    }

    /**
     * 对语句进行分词
     *
     * @param text 语句
     * @return 分词后的集合
     * @throws IOException
     */
    private static List segment(String text) throws IOException {
        List<String> list = new ArrayList<>();
        StringReader re = new StringReader(text);
        IKSegmenter ik = new IKSegmenter(re, true);
        Lexeme lex;
        while ((lex = ik.next()) != null) {
            list.add(lex.getLexemeText());
        }
        return list;
    }
}