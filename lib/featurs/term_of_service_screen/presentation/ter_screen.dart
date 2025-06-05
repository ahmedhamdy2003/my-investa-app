import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/core/utils/constant.dart';
import 'package:investa4/core/widgets/custom_buttons.dart';

class TermScreen extends StatelessWidget {
  const TermScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset('assets/images/back.png'),
                      const Spacer(),
                      Text('TOS & Privacy Policy', style: AppStyles.mainText20),
                      const Spacer(flex: 2),
                    ],
                  ),
                ),
              ),
              verticalSpce,
              Text(
                'Terms of Service(Tos) A legal agreement that outlines the rules and guidelines you must follow when accessing and using the platform \n Key components typically include:',
                style: AppStyles.mainText20,
              ),
              verticalSpce,
              verticalSpce,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                ),
                child: Column(
                  children: [
                    TermsItem(
                      data:
                          '1. Acceptance of Terms: Clarify that by using the platform, users agree to comply with the ToS.',
                    ),
                    TermsItem(
                      data:
                          '2. User Eligibility: Specify who can use the platform, such as age restrictions or jurisdictional limitations',
                    ),
                    TermsItem(
                      data:
                          '3. Account Responsibilities: Detail user obligations regarding account creation, maintenance, and security.',
                    ),
                    TermsItem(
                      data:
                          '4. Prohibited Activities: List activities that are not allowed, such as fraudulent behavior or unauthorized access.',
                    ),
                    TermsItem(
                      data:
                          '5. Investment Risks: Inform users about the inherent risks associated with investments and disclaim liability for financial losses.',
                    ),
                    TermsItem(
                      data:
                          '6. Fees and Payments: Outline any fees, payment terms, and refund policies.',
                    ),
                    TermsItem(
                      data:
                          '7. Intellectual Property Rights: Define the ownership of content and the permissible use of the platforms materials.',
                    ),
                    TermsItem(
                      data:
                          '8. Termination Clause: Describe the conditions under which accounts may be suspended or terminated.',
                    ),
                    TermsItem(
                      data:
                          '9. Dispute Resolution: Establish procedures for resolving disputes, such as arbitration or mediation.',
                    ),
                    TermsItem(
                      data:
                          '10. Governing Law: Specify the legal jurisdiction that governs the ToS.',
                    ),
                  ],
                ),
              ),
              verticalSpce,
              verticalSpce,
              Text(
                'Privacy Policy Informs users about how their personal information is collected, used, stored, and protected.Essential elements include:',
                style: AppStyles.mainText20,
              ),
              verticalSpce,
              verticalSpce,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                ),
                child: Column(
                  children: [
                    TermsItem(
                      data:
                          '1. Information Collection: Detail the types of personal data collected, such as names, contact information, and financial details.',
                    ),
                    TermsItem(
                      data:
                          '2. Use of Information: Explain how the collected data is utilized, including for account management, communication, and service improvement.',
                    ),
                    TermsItem(
                      data:
                          '3. Data Sharing and Disclosure: Specify if and when personal information is shared with third parties, such as service providers or legal authorities',
                    ),
                    TermsItem(
                      data:
                          '4. Data Security Measures: Describe the safeguards in place to protect user data from unauthorized access or breaches.',
                    ),
                    TermsItem(
                      data:
                          '5. User Rights: Inform users of their rights regarding their personal data, including access, correction, and deletion',
                    ),
                    TermsItem(
                      data:
                          '6. Cookies and Tracking Technologies: Disclose the use of cookies or similar technologies and their purposes.',
                    ),
                    TermsItem(
                      data:
                          '7. Data Retention: State how long personal information is retained and the criteria for data deletion.',
                    ),
                    TermsItem(
                      data:
                          '8. International Data Transfers: If applicable, explain how data is transferred and protected across different countries.',
                    ),
                    TermsItem(
                      data:
                          '9. Policy Updates: Notify users about how changes to the Privacy Policy will be communicated.',
                    ),
                    TermsItem(
                      data:
                          '10. Contact Information: Provide a way for users to contact the company with privacy-related inquiries.',
                    ),
                  ],
                ),
              ),
              verticalSpce,
              verticalSpce,
              Text(
                'Security Considerations Given the sensitive nature of financial data on investment platforms, implementing robust security measures is crucial:',
                style: AppStyles.mainText20,
              ),
              verticalSpce,
              verticalSpce,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                ),
                child: Column(
                  children: [
                    TermsItem(
                      data:
                          '. Data Encryption: Use encryption protocols to protect data in transit and at rest.',
                    ),
                    TermsItem(
                      data:
                          '. Access Controls: Implement strict access controls to ensure only authorized personnel can access sensitive information.',
                    ),
                    TermsItem(
                      data:
                          '. Regular Security Audits: Conduct periodic security assessments to identify and address vulnerabilities.',
                    ),
                    TermsItem(
                      data:
                          '. Compliance with Regulations: Ensure adherence to relevant data protection laws and financial regulations, such as the General Data Protection Regulation (GDPR) or the Egypt Consumer Privacy Act (ECPA).',
                    ),
                    TermsItem(
                      data:
                          '. User Education: Provide resources to educate users on best practices for maintaining their account security.',
                    ),
                  ],
                ),
              ),
              TermsItem(
                data:
                    'For detailed examples, you can refer to the Privacy Policies of established investment platforms:',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                ),
                child: Column(
                  children: [
                    TermsItem(
                      data:
                          '. Generation Investment Management: Their Privacy Policy outlines how personal information is used and protected.',
                    ),
                    TermsItem(data: '. Generation IM'),
                    TermsItem(
                      data:
                          '. Venn by Two Sigma: Their Privacy Policy describes data collection, usage, and disclosure practices. ',
                    ),
                    TermsItem(
                      data:
                          '. Venn Its advisable to consult with legal professionals to tailor these documents to your platforms specific needs and ensure compliance with applicable laws and regulations.',
                    ),
                  ],
                ),
              ),
              verticalSpce,
              verticalSpce,
              CustomButtom(title: 'Agree', onTap: () {}),
              verticalSpce,
              Center(child: CancelButton(onTap: () {})),
              verticalSpce,
              verticalSpce,
              verticalSpce,
              verticalSpce,
            ],
          ),
        ),
      ),
    );
  }
}

class TermsItem extends StatelessWidget {
  const TermsItem({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return Text(data, style: AppStyles.mainText16Regulat);
  }
}
