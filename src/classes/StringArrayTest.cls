public class StringArrayTest {
    public static List<String> generateStringArray( Integer arrSize ){
        List<String> lstStr;
        if( arrSize > 0 ){
            lstStr = new List<String>();
            for( Integer index = 0; index < arrSize; index++ ){
                lstStr.add('Test '+index);
            }
        }
        return lstStr;
    }
}