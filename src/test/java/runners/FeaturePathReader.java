package runners;

import com.intuit.karate.core.Step;

import java.util.ArrayList;
import java.util.List;

public class FeaturePathReader {

    public List<String>featurePaths;


    public FeaturePathReader() {
        this.featurePaths = new ArrayList<>();
        loadFeaturesPaths();
    }

    private void loadFeaturesPaths(){
        featurePaths.add("classpath:features/users.feature");
        //featurePath.add("classpath:features/postUser.feature");
        //featurePath.add("src/test/resources/feature/users.feature"); this possible as well!
//        featurePaths.add("classpath:features/postuserTwo.feature");
//        featurePaths.add("classpath:features/common.feature");
//        featurePaths.add("classpath:features/DeleteUser.feature");
        featurePaths.add("classpath:features/theFirstVerySample.feature");
        featurePaths.add("classpath:features/usingBackgroundKeyword.feature");
        featurePaths.add("classpath:features/firstPostUsers.feature");
        featurePaths.add("classpath:features/creatingSecondPostUser.feature");
        featurePaths.add("classpath:features/postAndPutUsers.feature");
        featurePaths.add("classpath:features/putUsers.feature");
        featurePaths.add("classpath:features/recapPostAndPutJan14Session.feature");
        featurePaths.add("classpath:features/recapGet&Post&Put_jan14.feature");
        featurePaths.add("classpath:features/postAndputUsers_Jan15.feature");
        featurePaths.add("classpath:features/using_user_json_file.feature");
        featurePaths.add("classpath:features/deleteuser_jan15.feature");
        featurePaths.add("classpath:features/delete_get_users_jan15.feature");
        featurePaths.add("classpath:features/create_get_update_delete_requests_jan15.feature");


    }

    public List<String> getFeaturePaths() {
        return featurePaths;
    }

    public void setFeaturePath(List<String> featurePaths) {
        this.featurePaths = featurePaths;
    }

//    public static void main(String[] args) {
//        FeaturePathReader  featurePathReader=new FeaturePathReader();
//        System.out.println(featurePathReader.getFeaturePath());
//
//    }


}