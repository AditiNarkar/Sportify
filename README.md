# Sportify ( _CCMS - Cricket Clubs Management System_)

<img src="https://drive.google.com/uc?export=view&id=1BSKdZLVKQ4Em7aYShH9DqsXkYvV3nKz5" style="width: 200px; max-width: 100%; height: auto" />


## Introduction
The main aim of Cricket Clubs Management System is to manage the details of Club activities, equipment’s, Members, Coaches, Practice sessions, Club’s Shop and other clubs’ activities. The project is built in a user-friendly manner through which user can communicate with the club virtually and the backend of the site is managed by the administrator.

Sportify has prominently three roles:
- The site has multiple of admins. He / She can overview matches happening between the clubs of the website. They are notified about the ongoing activities of the club. They can view the notifications sent and received by the coaches and the notifications received by the club members. The admin also handles database of the website.

- The coaches manage all the club members and select team members for upcoming club matches. The coach can challenge coaches of other clubs for matches. The coach can also set practice sessions for all the club members and notify them about it.

- The user has a choice of becoming a member of the club they want from list of clubs available. Initially, all the users are club members and the coach promote them to the team for the club matches. In addition, a club member can request the coach of their club to be in the team for the club matches.

## Features
- Sportify provides user a unique feature to become a club member of their choice and provides merchandise of all the available clubs.A shop where the members and coaches can buy the necessary accessories and equipment's. It will generate a bill for the buyer.

- A number of admins efficiently handles the website. They maintain design, database and provide timely responses to the users visiting the site.

- Sportify provides a convenient interface between the members and the coaches of the clubs. They can challenge other clubs for matches, arrange practice session for the club members within a snap of fingers and notify the coaches and the members for the same.

- The admin can handle and manipulate the system's database. He/she will be able to approve or disapprove the challenges and user registrations. Task of adding items to inventory will be handled by admin. He/she can also recruit coaches and register other clubs.

- The coach can set practice session timings for the team members, challenge other clubs, select team from members for the matches and book grounds.

- The members can view their profile, can check if they are selected in the team for the matches and receive notifications for the practice sessions and updates on matches of the clubs.

## Software used to build

1. Apache Tomcat Version 9.0.62 
2. Eclipse IDE
3. JDK 14.0.2 or above
4. MySQL Workbench 8.0 CE
5. Microsoft VS Code Editor
6. Web Browser (Google Chrome and Internet Explorer)
7. Blender with Verge3D add-on (Wont be needed to run in your machine)
8. GitHub

## Logical flow

<img src="https://drive.google.com/uc?export=view&id=1S1zMq4EGPn4JKp3yiq4UEKwiBIDiwws_" style="width: 100%; max-width: 100%; height: auto" />

## Database Schema

<img src="https://drive.google.com/uc?export=view&id=1xp-zmDzSloPAefhzVWitXHyprXcDOH9N" style="width: 100%; max-width: 100%; height: auto" />

<img src="https://drive.google.com/uc?export=view&id=11QU-lt74Qntm7k5jgehKeUa8vCzK9YWt" style="width: 100%; max-width: 100%; height: auto" />

<img src="https://drive.google.com/uc?export=view&id=1uKVhS7O3fCx6cV_SS1QhxpfwLErUG0eQ" style="width: 100%; max-width: 100%; height: auto" />

## Installation

Sportify requires a server machine with the project file and other client machines who are on same network connection with the server.

> List of softwares required: 
>
> 1. Apache Tomcat (Recommended - Version 9.0.62 )
> 2. Any Java IDE
> 3. JDK 14.0.2 or above
> 4. MySQL Workbench
> 5. Code Editor
> 6. Web Browser

Clone the repository CCMSCurrent and Database File in server machine.
> Default username is set to 'root' and no password in the project.

> Note : Recommended to keep port for MySQL server as 3306

Move it in Tomcat webapps folder.

Configure the database files in MySQL and run tomcat server. 

>In following pages, change the email credentials and to,from variables: 
> - 'admin-club-operations.jsp'
> - 'admin-reply-operations.jsp'
>
> The sender-email must ON the Less Secure apps feature in Google. (This feature is now discarded by Google. We can do it using authentication key provided.)

Open browser with index.jsp file:
```sh 
localhost:<tomcat-port>/CCMSCurrent/index.jsp
```
> Default tomcat port is 8080

Clients can connect to server using in browser:
```sh
localhost:<server-IP-address>
```
> We can get server IP address by entering ipconfig (Windows) or ifconfig (Linux/Mac) in terminal.

## Implementation

Home page

<img src="https://drive.google.com/uc?export=view&id=1mVh-k_LdzZHHGBR6EqPj9Mq_uiW5-vri" style="width: 100%; max-width: 100%; height: auto" />

There are seven sections in home page:
1. Navigation bar.
2. Central screen that contains the logo, “LOGIN” & “JOIN CLUB” buttons and sliding banner of cricket photos in the background.
3. About Us section stating the information of our website.
4. Services offered by Sportify.
5. Users / Coaches can send request to admins of Sportify to add their club by clicking on “APPLY NOW” button.
6. Users can send their queries to admins in Contact Us section.
7. Footer section.

When clicked on “JOIN CLUB” button, list of clubs that are approved by admin are displayed for the users to view and join:

<img src="https://drive.google.com/uc?export=view&id=1NsAVErlTTYMQ0W9yEcpQRE3q6TbdxWt0" style="width: 100%; max-width: 100%; height: auto" />

When clicked on “View” button on any club, information about that club is displayed:

<img src="https://drive.google.com/uc?export=view&id=13IrGQKS7CEt3WPCdgT1q4YTnmoBKrSXm" style="width: 100%; max-width: 100%; height: auto" />

When clicked on “Apply Now” of home page in fifth section, “Add club” form is opened up:

<img src="https://drive.google.com/uc?export=view&id=1DQID7Qdg_1xtS82l-WSQYqRiAno3FR6u" style="width: 100%; max-width: 100%; height: auto" />

Minimum capacity of a club should be atleast 10 members & age of head coach should be atleast 20 years. After filling out all the necessary information, the add club request is sent to admin. The following screenshot is of admin login displaying notification of club requests. There are three status of clubs as:
1. Pending – The club is yet to be reviewed by admin.
2. Approved – The club has been approved by admin and users of that club can login into the system and access all the features.
3. Disapproved – The club has been disapproved by admin and users of that club cannot login into the system and cannot access the features.

<img src="https://drive.google.com/uc?export=view&id=1_Og5YlfnfakTR2Hi8Z7xj87iSbbXM26B" style="width: 100%; max-width: 100%; height: auto" />

The admin can click “Click to View” link to view the information proposed. He can choose to Accept (Approve) or Reject (Disapprove):

<img src="https://drive.google.com/uc?export=view&id=1Gj_LYxACzh51JtXem6kLeNghbbungWF_" style="width: 100%; max-width: 100%; height: auto" />

<img src="https://drive.google.com/uc?export=view&id=1UdjYFbLE-Q8U4rSRmUJuGDridlOMdlXx" style="width: 100%; max-width: 100%; height: auto" />

Gmail about the approval received :

<img src="https://drive.google.com/uc?export=view&id=1fJzWKe_lSXsMuIqXy0b0diJaJ-mjxvpO" style="width: 100%; max-width: 100%; height: auto" />

Similar operations can be performed to “Disapprove” a club.

Admin can also view and reply the “Contact Us” (sixth section in home page) users.

> User side:
>
><img src="https://drive.google.com/uc?export=view&id=1mJdZrRgyL0dnhd9RFkXsi8ng9TmeNGzn" style="width: 100%; max-width: 100%; height: auto" />

> Admin Side:
>
><img src="https://drive.google.com/uc?export=view&id=13UC4onec5suIV5wOurR5SUcEWvMrvLoY" style="width: 100%; max-width: 100%; height: auto" />

> Admin’ reply is then sent to the user via Gmail:
>
><img src="https://drive.google.com/uc?export=view&id=19R4nAhNeRmiFNIdV6ehJwIEnkOh3LDML" style="width: 100%; max-width: 100%; height: auto" />

Registration Page for member:

<img src="https://drive.google.com/uc?export=view&id=1V-VlcoBhqu1UJaS38W1YhVhZwO2TiMNL" style="width: 100%; max-width: 100%; height: auto" />

There are four logins for every user as:

<img src="https://drive.google.com/uc?export=view&id=1dSD7E0U1J0kPzNZ9uJrbbSt0QIbVeJmc" style="width: 100%; max-width: 100%; height: auto" />

If user clicks on “Forget Password”, he/she can reset it by:

<img src="https://drive.google.com/uc?export=view&id=1ALHPj6v9BjDMWeBTnuOe5gt_KFW-WCVS" style="width: 100%; max-width: 100%; height: auto" />

For valid coach login, coach dashboard appears:

<img src="https://drive.google.com/uc?export=view&id=1MvOEMSoLiwuHYuWg-h3YqstHtSJvP6-6" style="width: 100%; max-width: 100%; height: auto" />

My Profile page for coach lets the coach to update his personal information to be displayed to other users and the practise session timings for his club’s team and member:

<img src="https://drive.google.com/uc?export=view&id=1yQbUITZj3l4Fdsf6ydm9ro9obYokHEQ7" style="width: 100%; max-width: 100%; height: auto" />

Adding new practise session for team:

<img src="https://drive.google.com/uc?export=view&id=1Rew5ZXOaUpLR4q028m91Y5LfEPFbAN8p" style="width: 100%; max-width: 100%; height: auto" />

After clicking “SAVE” button Session ID and Current Capacity are filled automatically:

<img src="https://drive.google.com/uc?export=view&id=1j8eMvcIQRPTZDuWwFWAIaQoKGfytKfG3" style="width: 100%; max-width: 100%; height: auto" />

Only team members (excluding the normal members) only of that club are notified about the changed session timings:

> Team Side of Club:
> 
> <img src="https://drive.google.com/uc?export=view&id=1WN8oj_dWCGUB_3B_ImXx_t0F8JVm6IAr" style="width: 100%; max-width: 100%; height: auto" />
>
>After clicking on “Click to check” link, “My Club” page of Team side opens up displaying information of the club. The practice session section shows the updated timings by coach of that club. The “Currently In” column shows in which session slot the logged in team member is:
> 
> <img src="https://drive.google.com/uc?export=view&id=1oDpECVZMvilhu6wAosKiGdvO4MApfGSR" style="width: 100%; max-width: 100%; height: auto" />
>
>If the team member wants to change the session slot for himself, he can check the “Currently In” radio button beside the desired time slot. For instance if this logged in team member wants to join SES31 instead of SES16:
> 
><img src="https://drive.google.com/uc?export=view&id=1ZsEn1MESKrKfgiTshaOYLqKQUWfok_i1" style="width: 100%; max-width: 100%; height: auto" />
>
><img src="https://drive.google.com/uc?export=view&id=1PrkRCV2yP9ITXREVjb3q8cvhSOmirGtQ" style="width: 100%; max-width: 100%; height: auto" />
> If he/she is a team member, he cannot choose slots of member side.
> In addition, the “Current Capacity” column is updated and coach is informed about it.
>
>Coach Side:
> 
><img src="https://drive.google.com/uc?export=view&id=1CcBgPDQTnrPbdMK1lq7iUTsaUDcfpURw" style="width: 100%; max-width: 100%; height: auto" />

One head coach of a club can challenge another head coach of another club on a specified date, time and venue. Let us assume “Thunder Wolves” Club is challenging “Spartan Strikers”:

<img src="https://drive.google.com/uc?export=view&id=1vSAwMVFXyzQepO1mMiISVLPwXicfpgHr" style="width: 100%; max-width: 100%; height: auto" />

There is also “Swap” link which is used to swap team members with normal club member for a particular match only. For e.g. Swapping “Aditya Kachre” with “John”:

<img src="https://drive.google.com/uc?export=view&id=1ljWDC8VK87dwMcsuabz-oKfyJ6xVbLqD" style="width: 100%; max-width: 100%; height: auto" />
<img src="https://drive.google.com/uc?export=view&id=1NvihdJtaY6fn2NP-yhp_-weXhY7Pc4ks" style="width: 100%; max-width: 100%; height: auto" />

The “Want to edit team members?” link opens list of all club members with options to add to team, delete from team and remove from club:

<img src="https://drive.google.com/uc?export=view&id=1SR2bb_t6WGY5XRBgG1gvEpp2Li6TjIrj" style="width: 100%; max-width: 100%; height: auto" />

After “Thunder Wolves” head coach clicks “Challenge” button, request is sent to “Spartan Strikers” head coach as well as a notification to the head coach himself:

>Thunder Wolves side:
>
<img src="https://drive.google.com/uc?export=view&id=1wCYVExX4k9R26odBlx6V4pti2Ah4az-s" style="width: 100%; max-width: 100%; height: auto" />

>Spartan Strikers side:
>
><img src="https://drive.google.com/uc?export=view&id=17PJZdErcKpG2aUgOFmATliUMPLmp_eeZ" style="width: 100%; max-width: 100%; height: auto" />

“Edit your team before accepting” lets the challenged club to edit his team members before accepting the match request:

<img src="https://drive.google.com/uc?export=view&id=1fFqKCUoSfVDD29NHmz_DcN-6mCwPpVDO" style="width: 100%; max-width: 100%; height: auto" />

Coach can also view challenge requests in “View Requests” tab:

<img src="https://drive.google.com/uc?export=view&id=1Bktx2sUnxQkyag5WgLKttrzoPHL2RvDr" style="width: 100%; max-width: 100%; height: auto" />

If challenged club denies the request, only the challenging club is informed about it.

However, if the challenged club accepts the request of the challenging club, all clubs are notified with:

<img src="https://drive.google.com/uc?export=view&id=1K1VHQg8fSV3lhUJd0SwsFExbZV27yb-h" style="width: 100%; max-width: 100%; height: auto" />

In addition to this, the team members selected and the swapped members for that particular challenge of both the teams are requested to play.

> (Team Member of Spartan Strikers)
> 
<img src="https://drive.google.com/uc?export=view&id=1lWZ90K2t-1HBeUw-woN6CqAnn-aCclLB" style="width: 100%; max-width: 100%; height: auto" />

>(Coach of Spartan Strikers)
>
><img src="https://drive.google.com/uc?export=view&id=1GKfKQqNMhS3k045X1YDZrfPFOi4iytoQ" style="width: 100%; max-width: 100%; height: auto" />
>My Team Formed section updated with notification.

Similarly, if any player rejects the request, coach is informed about it. In addition to this, coach can view who all have accepted the challenge and are in team. He can also make the player captain of the club team by clicking the radio button.
>Team members are informed about the same:
>
><img src="https://drive.google.com/uc?export=view&id=1UO1CGZBdR9vUlrv12w5t3TuoS2n0wZ-0" style="width: 100%; max-width: 100%; height: auto" />

Only the swapped club member of Thunder Wolves is requested and not the team member who was swapped.

> Swapped Club member of Thunder Wolves
> 
><img src="https://drive.google.com/uc?export=view&id=1XUJhvuYnT6Ol8KnqglFI-RgPvdTRb_YZ" style="width: 100%; max-width: 100%; height: auto" />

>Coach can view approvals of team in “Team Approval” tab:
>
><img src="https://drive.google.com/uc?export=view&id=1Mn_bLfKsqhYrBnN0B1V2Hx6jUsdUDMja" style="width: 100%; max-width: 100%; height: auto" />

The ones who are not in team but in the club can request the club’s head coach to participate in the match only in which their club is playing:
>Normal Club Member (not in team) of Thunder Wolves:
>
><img src="https://drive.google.com/uc?export=view&id=1pChKeypjYfyPfnnToFJ2uqztVZLrS4fm" style="width: 100%; max-width: 100%; height: auto" />

If member clicks on “Request to participate” link:
>Coach of Thunder Wolves will get notification:
>
><img src="https://drive.google.com/uc?export=view&id=1HikHY3FtHNvR0UPH47SU3a0eOJrl2hnF" style="width: 100%; max-width: 100%; height: auto" />

If coach clicks on “Let Play” link:
>Member of Thunder Wolves
>
><img src="https://drive.google.com/uc?export=view&id=1xqGwendN_PCBLrIuFp10WeNGdrDRUHRW" style="width: 100%; max-width: 100%; height: auto" />

Coaches can also post text messages to all coaches (excluding the members) and to only his club members:

>Head coach of Thunder Wolves posting to coaches: (Top right)
>
><img src="https://drive.google.com/uc?export=view&id=1GzsI9i5D3dkhaEP9U0ckzTRcTqhD6oks" style="width: 100%; max-width: 100%; height: auto" />
>Visible to all head coaches including himself:
>
><img src="https://drive.google.com/uc?export=view&id=1jz7rnsLdrLW6aAKwo5WRURYvmCarw6Oa" style="width: 100%; max-width: 100%; height: auto" />

>Head coach of Thunder Wolves posting to club members:
>
><img src="https://drive.google.com/uc?export=view&id=11lv6rRn86cqfPBH5RmZr-czG0iiT4QLI" style="width: 100%; max-width: 100%; height: auto" />

>Visible to all club members and team of Thunder Wolves:
>
><img src="https://drive.google.com/uc?export=view&id=1HJEyBMtTBNGwhKeFlyR4VpY9u14dDunn" style="width: 100%; max-width: 100%; height: auto" />

Administrator login opens admin dashboard:

<img src="https://drive.google.com/uc?export=view&id=1GAyPbYUJS1mkSGptVANxU1VdCFQ6sNwy" style="width: 100%; max-width: 100%; height: auto" />

Admin can view all members:

<img src="https://drive.google.com/uc?export=view&id=19iw3Drs69ObVHKGovbqV60EZ-8XW1s6S" style="width: 100%; max-width: 100%; height: auto" />

Admin can view all clubs:

<img src="https://drive.google.com/uc?export=view&id=1wu-6B6lQvTJCPZ0dxAoi2WlcczykNS6S" style="width: 100%; max-width: 100%; height: auto" />
<img src="https://drive.google.com/uc?export=view&id=1svYZUxMvlAbW2VrpQW6u4vlBQc_Df1nN" style="width: 300px; max-width: 50%; height: auto" />
<img src="https://drive.google.com/uc?export=view&id=1KBqECjqCQg9EFrYAH1sL6Vwijp5BOmc1" style="width: 300px; max-width: 50%; height: auto" />

Viewing “Thunder Wolves” Club:

<img src="https://drive.google.com/uc?export=view&id=1JuLGupQdu7IxT-ip7bKpD-JjCf48vGJB" style="width: 100%; max-width: 100%; height: auto" />

Admin can update his/her profile like all other roles:

<img src="https://drive.google.com/uc?export=view&id=1bjDWJXsfv0FZG64rWE0xc6RVIVol5GRP" style="width: 100%; max-width: 100%; height: auto" />

Shop section opens 3D model that changes logo when clicked on the club’s logo:

<img src="https://drive.google.com/uc?export=view&id=1qEezEk0UcNQJVarT3YdzoClLzJFTuleS" style="width: 100%; max-width: 100%; height: auto" />
<img src="https://drive.google.com/uc?export=view&id=1ZHzpLp--YVq18BZcodjeEPwYjpIDYo97" style="width: 100%; max-width: 100%; height: auto" />

## Future Scope
- Turn the website into an android-based application for more user-friendly interface.
- To add site map in website.
- Add an archive section where users can browse details of previously conducted matches and other activities of the club.
- Upgrade the system from cricket oriented to sports based management system.

## Contributers

[Tufayl Dalvi](https://github.com/Tufayl18) (Suggested working and made database), Aatmaja Joshi ( worked with verge3D model ) + 1

## Contact

Aditi Narkar
- Gmail - aditinarkar2004@gmail.com
- Instagram - [@narkar08](https://www.instagram.com/narkar08/)
- LinkedIn - [Aditi Narkar](https://www.linkedin.com/in/aditi-narkar-0936a31b1/)
- Github - [AditiNarkar](https://github.com/AditiNarkar)
