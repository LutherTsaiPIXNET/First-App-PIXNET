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
實作StyleMe App的登入畫面，並利用FBSDKLoginKit所提供的API，取得應用程式授權
![Alt text](/img/登入畫面.png)
除了Facebook登入按鈕，其他功能只有實作元件，並沒有串接後台

##### FBSDKShareKit
在商品資訊頁，加入Share Button，點按時會利用FBSDKShareKit呼叫iOS內建分享功能或Safari，並自動嵌入商品PIXstyleMe連結，使用者可以編輯分享內容後分享
![Alt text](/img/分享資訊.png)
![Alt text](/img/分享結果.png)
