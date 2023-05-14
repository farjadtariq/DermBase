//
//  termsNprivacyUtil.swift
//  DermBase
//
//  Created by Farjad on 11/05/2023.
//

import SwiftUI

//Terms and Conditions Simplified
struct termsSimplified: View
{
    var body: some View
    {
        Group
        {
            Text("\nTerms and Conditions [Simplified]")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: "E37825"))
            
            Text("\n1. By using Dermbase, you agree to follow these terms and conditions, applicable laws, and regulations.\n2. Please review our Privacy Policy to understand our data collection practices.\n3. All content on Dermbase is copyrighted and owned by Legend EHR.\n4. You may only download one copy of Dermbase per device for personal use. Do not modify, copy, or use the app for commercial purposes. Follow the restrictions mentioned in the detailed terms.\n5. You use the app and its content at your own risk, and we're not liable for any damages or unauthorized use.\n6. Legend EHR is not liable for any damages arising from using or being unable to use Dermbase.\n7. You are responsible for data charges and ensuring a stable internet connection to use Dermbase.\n8. Keep your device charged; Legend EHR is not responsible for any disruption due to battery issues.\n9. Dermbase is not liable for any loss experienced due to reliance on the app's information.\n10. Dermbase is provided on an 'as is' basis with no warranties.\n11. Legend EHR is not responsible for any linked third-party websites.\n12. By using our app, you consent to receive communications from us related to your usage.\n13. These terms and conditions are governed by the laws of the United States.\n14. Accept app updates when offered and stop using the app if your license is terminated.\n15. We may update our Terms and Conditions, and your continued use of Dermbase indicates your agreement to any changes.\n16. If you have any questions or suggestions, please contact us at info@dermbase.com.\n")
                .font(.body)
               // .foregroundColor(Color.black)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

// Privacy policy simplified
struct privacyPolicySimplified: View
{
    var body: some View
    {
        Group
        {
            Text("\nPrivacy Policy [Simplified]")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: "E37825"))
            
            Text("\n1. We collect and store your personal information to improve your experience and provide our services.\n2. We use third-party services like Firebase Authentication, Firebase Firestore, and Apple services for user authentication, database, and data logging.\n3. Our app is not intended for children under 18 years old.\n4. We may share your data with third parties only when necessary for providing the service or if required by law.\n5. You have the right to access, modify, and delete your personal data.\n6. We use cookies to enhance your experience on our app.\n")
                .font(.body)
                //.foregroundColor(Color.black)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}


// Terms and Conditions (Detailed)
struct termsDetailed: View
{
    var body: some View
    {
        group1
        group2
        group3
        group4
        group5
    }
    
    var group1: some View
    {
        Group
        {
            Text("\nPlease read these terms and conditions (\"terms\", \"conditions\") carefully before using Dermbase application (\"application\", \"service\") operated by Legend EHR (\"us\", \"we\", \"our\").")
                .font(.body)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("\nAcceptance of Terms and Conditions of Use")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("We will provide the services to you which are subject to the conditions stated below in this document. By accessing and using the Dermbase app, you agree to be bound by these Terms and Conditions, all applicable laws and regulations, and agree that you are responsible for compliance with any applicable local laws. If you do not agree with any of these terms, you are prohibited from using or accessing Dermbase. Every time you visit this application or use its services, you accept the following conditions. This is why we urge you to read them carefully.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Privacy Policy")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("Before you continue using our application, we advise you to read our privacy policy [insert privacy policy link] to better understand our data collection practices.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Copyright")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("Content published on this application (digital downloads, images, texts, graphics, logos) is the property of Legend EHR and/or its content creators and protected by international copyright laws. The entire compilation of the content found on this application is the exclusive property of Legend EHR, with copyright authorship for this compilation by Legend EHR.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }
        //.foregroundColor(Color.black)
    }
    
    var group2: some View
    {
        Group
        {
            Text("Communications")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("By using this application, it is deemed that you have consented to receiving communications from us regarding your use of the application. We may use various means of communication, including but not limited to email, text, in-app notifications, or other messaging services.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Application Usage")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("Your use of any information or materials on this application is entirely at your own risk, for which we shall not be liable. It shall be your responsibility to ensure that any products, services, or information available through this application meet your specific requirements. Unauthorized use of this application may give rise to a claim for damages and/or be a criminal offense.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Use License and Restrictions")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("a. Permission is granted to temporarily download one copy of Dermbase per device for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license you may not:\ni. modify or copy the materials;\nii. use the materials for any commercial purpose, or for any public display (commercial or non-commercial);\niii. attempt to decompile or reverse engineer any software contained in Dermbase;\niv. remove any copyright or other proprietary notations from the materials; or\nv. transfer the materials to another person or \"mirror\" the materials on any other server.\nb. This license shall automatically terminate if you violate any of these restrictions and may be terminated by Legend EHR at any time. Upon terminating your viewing of these materials or upon the termination of this license, you must destroy any downloaded materials in your possession, whether in electronic or printed format.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Internet Connection and Mobile Data Charges")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("Dermbase requires an active internet connection to function properly. You are responsible for any data charges incurred while using the app, including roaming charges if applicable. Dermbase is not responsible for the app not working at full functionality if you don’t have access to Wi-Fi or sufficient mobile data.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }
       // .foregroundColor(Color.black)
    }
    
    var group3: some View
    {
        Group
        {
            Text("Device Charging and Battery Life")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("You are responsible for ensuring that your device stays charged. If your device runs out of battery, Legend EHR cannot accept responsibility for any disruption in the app's service.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Information Reliability and Liability")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("Although we endeavor to ensure that the information provided in Dermbase is accurate and up-to-date, we rely on third parties to provide some of the information. Dermbase accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this information.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("App Updates and Termination")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("We may update the app or discontinue its availability at any time without notice. You agree to accept any updates to the app when offered to you. Upon termination, the rights and licenses granted to you in these terms will end, and you must stop using the app and delete it from your device.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }
       // .foregroundColor(Color.black)
    }
    
    var group4: some View
    {
        Group
        {
            Text("Disclaimer")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("The materials within Dermbase are provided on an 'as is' basis. Legend EHR makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Limitations of Liability")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("In no event shall Legend EHR or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use Dermbase, even if Legend EHR or a Legend EHR authorized representative has been notified orally or in writing of the possibility of such damage.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Third-Party Links")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("Dermbase may contain links to third-party websites. Legend EHR is not responsible for the contents of any such linked site. The inclusion of any link does not imply endorsement by Legend EHR of the site. Use of any such linked website is at the user's own risk.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }
       // .foregroundColor(Color.black)
    }
    
    var group5: some View
    {
        Group
        {
            Text("Governing Law")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("These terms and conditions are governed by and construed in accordance with the laws of the United States, and you irrevocably submit to the exclusive jurisdiction of the courts in that State or location.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Changes to the Terms and Conditions")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("Legend EHR may revise these Terms and Conditions for its app at any time without notice. You should review these terms and conditions periodically. Your continued use of Dermbase after any modification indicates your agreement to the modified terms and conditions and thus be bound by the then-current version of these Terms and Conditions.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Contact Information")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("If you have any questions or suggestions regarding our Terms and Conditions, please do not hesitate to contact us at info@dermbase.com.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }
       // .foregroundColor(Color.black)
    }
}

// Privacy Policy (detailed)
struct privacyPolicyDetailed: View
{
    
    var body: some View
    {
        group1
        group2
        group3
        group4
    }
    
    var group1: some View
    {
        Group
        {
            Text("\nDermbase (\"Dermbase\", \"we,\" or \"us\"), a subsidiary of Legend EHR, takes your privacy very seriously. This privacy policy describes our collection and protection of the information you provide to us on the \"app\". If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.\n\nThe terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Dermbase unless otherwise defined in this Privacy Policy.")
                .font(.body)
                //.foregroundColor(Color.black)
                .fixedSize(horizontal: false, vertical: true)
                 
            Text("\nInformation Collection and Use")
                .font(.title3)
                //.foregroundColor(Color.black)
                .fontWeight(.bold)
                 
            Text("For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to profile/identity, contact data, billing data, and transactional data. The information that we request will be retained by us and used as described in this privacy policy.\n\nThe app does use third-party services that may collect information used to identify you. Links to privacy policy of third-party service providers used by the apps:")
                .font(.body)
               // .foregroundColor(Color.black)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Link("● Apple App Store Services", destination: URL(string: "https://developer.apple.com/support/terms/")!)
            Link("● Google Firebase", destination: URL(string: "https://policies.google.com/")!)

            Text("Log Data")
                .font(.title3)
               // .foregroundColor(Color.black)
                .fontWeight(.bold)
            
            Text("We want to inform you that whenever you use our Service, in case of an error in the app, we collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.")
                .font(.body)
               // .foregroundColor(Color.black)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
        }
    }
    
    var group2: some View
    {
        Group
        {
            Text("Cookies")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.\nThis Service does not use these “cookies” explicitly. However, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Service Providers")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("We may employ third-party companies and individuals due to the following reasons:\n● To facilitate our Service;\n● To provide the Service on our behalf;\n● To perform Service-related services; or\n● To assist us in analyzing how our Service is used.\nWe want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)

            Text("Security")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            
        }
        //.foregroundColor(Color.black)
    }
    
    var group3: some View
    {
        Group
        {
            Text("Links to Other Sites")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Children’s Privacy")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("These Services are intended for individuals aged 13 or above. We do not knowingly collect personally identifiable information from children under 13. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we can take the necessary actions to remove such information from our servers.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }
        //.foregroundColor(Color.black)
    }
    
    var group4: some View
    {
        Group
        {
            Text("Changes to This Privacy Policy")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately after they are posted on this page.")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Contact Us")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at info@dermbase.com")
                .font(.body)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("By using Dermbase, you hereby consent to our Privacy Policy and agree to its terms.")
                .font(.body)
                .fixedSize(horizontal: false, vertical: true)
        }
       // .foregroundColor(Color.black)
    }
}
