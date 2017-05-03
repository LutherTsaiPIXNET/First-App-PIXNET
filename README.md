# First-App-PIXNET
First-App in PIXNET

DEMO利用Shadow提供的PIXNET API撈回所需呈現的資料。
利用AFNetworking抓取API資料，並利用YYModel建立model -> Item
再利用SDAutoLayout、SDWebImage將資料呈現在UITableView上

### iOS App Developer Training - Week 02

#### Facebook SDK
在Facebook建立一個App - FirstAppPIXNET，加入這個部分的實作

##### FBSDKCoreKit
利用FBSDKCoreKit所提供之API，加入App Delegate，使App可以自己Handle Facebook Login Status, UserID, Token, and etc.

##### FBSDKLoginKit
實作StyleMe App的登入畫面，並利用FBSDKLoginKit所提供的API，取得應用程式授權<br>
<img src="img/登入畫面.png" height="160" width="90"><br>
除了Facebook登入按鈕，其他功能只有實作元件，並沒有串接後台<br>
實際操作方式為App啟動時，會再ListViewController有一個登入按鈕<br>
點選按鈕會跳出登入畫面，即可使用Facebook登入。登入後，會自動跳轉回原List畫面<br>
List畫面上的『登入』，也會隨之改變為『登出』
點選『登出』，會Call FBSDKLoginKit API to logout，並清除儲存的Token，『登出』，也會隨之改變為『登入』。


##### FBSDKShareKit
在商品資訊頁，加入Share Button，點按時會利用FBSDKShareKit呼叫iOS內建分享功能或Safari，並自動嵌入商品PIXstyleMe連結，使用者可以編輯分享內容後分享<br>
<img src="img/分享資訊.png" height="160" width="90"><br>
<img src="img/分享結果.png" height="90" width="160"><br>
