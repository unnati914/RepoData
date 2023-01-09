//
//  ViewController.swift
//  RepoData
//
//  Created by Unnati on 21/10/1944 Saka.
//

import UIKit

class MyCell: UITableViewCell {
    
    @IBOutlet weak var newLabel: UILabel!
    
    
    
}




class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var result: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()
        
        view.addSubview(tableView)
        view.backgroundColor = .link
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Repos ID"
    }
    func tableView(_ tableView: UITableView, titleFor section: Int) -> String? {
        return "\(result?[section].fullName)"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let result = result {
            return result.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = result?[indexPath.row].fullName ?? "Name not present"
        let text = "\(name)"
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! MyCell
        cell.newLabel.text = text
        //let text = result?.data[indexPath.section].items[indexPath.row]
        return cell
    }
    
    private func parseJSON(){
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else{
            return
        }
        let url = URL(fileURLWithPath: path)
        do{
            let jsonData = try Data(contentsOf: url)
            let parsedData = try? JSONDecoder().decode(Result.self, from: jsonData)
            //print(parsedData?.first?.id)
            //print(parsedData?.first?.nodeID)
            print(parsedData?.first?.fullName)
            
            result = parsedData
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            
        }
        catch {
            print("Error : \(error)")
        }
    }
    
}

// MARK: - ResultElement
struct ResultElement: Codable {
    // let id: Int?
    let  fullName: String
    //    let resultPrivate: Bool
    //    let owner: Owner
    //    let htmlURL: String
    //    let description: String?
    //    let fork: Bool
    //    let url: String
    //    let forksURL: String
    //    let keysURL, collaboratorsURL: String
    //    let teamsURL, hooksURL: String
    //    let issueEventsURL: String
    //    let eventsURL: String
    //    let assigneesURL, branchesURL: String
    //    let tagsURL: String
    //    let blobsURL, gitTagsURL, gitRefsURL, treesURL: String
    //    let statusesURL: String
    //    let languagesURL, stargazersURL, contributorsURL, subscribersURL: String
    //    let subscriptionURL: String
    //    let commitsURL, gitCommitsURL, commentsURL, issueCommentURL: String
    //    let contentsURL, compareURL: String
    //    let mergesURL: String
    //    let archiveURL: String
    //    let downloadsURL: String
    //    let issuesURL, pullsURL, milestonesURL, notificationsURL: String
    //    let labelsURL, releasesURL: String
    //    let deploymentsURL: String
    //    let createdAt, updatedAt, pushedAt: Date
    //    let gitURL, sshURL: String
    //    let cloneURL: String
    //    let svnURL: String
    //    let homepage: String?
    //    let size, stargazersCount, watchersCount: Int
    //    let language: String?
    //    let hasIssues, hasProjects, hasDownloads, hasWiki: Bool
    //    let hasPages, hasDiscussions: Bool
    //    let forksCount: Int
    ////    let mirrorURL: JSONNull?
    //    let archived, disabled: Bool
    //    let openIssuesCount: Int
    //    let license: License?
    //    let allowForking, isTemplate, webCommitSignoffRequired: Bool
    //    let topics: [String]
    //    let visibility: Visibility
    //    let forks, openIssues, watchers: Int
    //    let defaultBranch: DefaultBranch
    
    enum CodingKeys: String, CodingKey {
        //case id
        //case nodeID = "node_id"
        // case name
        case fullName = "full_name"
        //        case resultPrivate = "private"
        //        case owner
        //        case htmlURL = "html_url"
        //        case description, fork, url
        //        case forksURL = "forks_url"
        //        case keysURL = "keys_url"
        //        case collaboratorsURL = "collaborators_url"
        //        case teamsURL = "teams_url"
        //        case hooksURL = "hooks_url"
        //        case issueEventsURL = "issue_events_url"
        //        case eventsURL = "events_url"
        //        case assigneesURL = "assignees_url"
        //        case branchesURL = "branches_url"
        //        case tagsURL = "tags_url"
        //        case blobsURL = "blobs_url"
        //        case gitTagsURL = "git_tags_url"
        //        case gitRefsURL = "git_refs_url"
        //        case treesURL = "trees_url"
        //        case statusesURL = "statuses_url"
        //        case languagesURL = "languages_url"
        //        case stargazersURL = "stargazers_url"
        //        case contributorsURL = "contributors_url"
        //        case subscribersURL = "subscribers_url"
        //        case subscriptionURL = "subscription_url"
        //        case commitsURL = "commits_url"
        //        case gitCommitsURL = "git_commits_url"
        //        case commentsURL = "comments_url"
        //        case issueCommentURL = "issue_comment_url"
        //        case contentsURL = "contents_url"
        //        case compareURL = "compare_url"
        //        case mergesURL = "merges_url"
        //        case archiveURL = "archive_url"
        //        case downloadsURL = "downloads_url"
        //        case issuesURL = "issues_url"
        //        case pullsURL = "pulls_url"
        //        case milestonesURL = "milestones_url"
        //        case notificationsURL = "notifications_url"
        //        case labelsURL = "labels_url"
        //        case releasesURL = "releases_url"
        //        case deploymentsURL = "deployments_url"
        //        case createdAt = "created_at"
        //        case updatedAt = "updated_at"
        //        case pushedAt = "pushed_at"
        //        case gitURL = "git_url"
        //        case sshURL = "ssh_url"
        //        case cloneURL = "clone_url"
        //        case svnURL = "svn_url"
        //        case homepage, size
        //        case stargazersCount = "stargazers_count"
        //        case watchersCount = "watchers_count"
        //        case language
        //        case hasIssues = "has_issues"
        //        case hasProjects = "has_projects"
        //        case hasDownloads = "has_downloads"
        //        case hasWiki = "has_wiki"
        //        case hasPages = "has_pages"
        //        case hasDiscussions = "has_discussions"
        //        case forksCount = "forks_count"
        ////        case mirrorURL = "mirror_url"
        //        case archived, disabled
        //        case openIssuesCount = "open_issues_count"
        //        case license
        //        case allowForking = "allow_forking"
        //        case isTemplate = "is_template"
        //        case webCommitSignoffRequired = "web_commit_signoff_required"
        //        case topics, visibility, forks
        //        case openIssues = "open_issues"
        //        case watchers
        //        case defaultBranch = "default_branch"
    }
}

enum DefaultBranch: String, Codable {
    case develop = "develop"
    case main = "main"
    case master = "master"
}

// MARK: - License
struct License: Codable {
    let key: Key
    let name: Name
    let spdxID: SpdxID
    let url: String?
    let nodeID: LicenseNodeID
    
    enum CodingKeys: String, CodingKey {
        case key, name
        case spdxID = "spdx_id"
        case url
        case nodeID = "node_id"
    }
}

enum Key: String, Codable {
    case mpl20 = "mpl-2.0"
    case other = "other"
}

enum Name: String, Codable {
    case mozillaPublicLicense20 = "Mozilla Public License 2.0"
    case other = "Other"
}

enum LicenseNodeID: String, Codable {
    case mDc6TGljZW5ZZTA = "MDc6TGljZW5zZTA="
    case mDc6TGljZW5ZZTE0 = "MDc6TGljZW5zZTE0"
}

enum SpdxID: String, Codable {
    case mpl20 = "MPL-2.0"
    case noassertion = "NOASSERTION"
}

// MARK: - Owner
struct Owner: Codable {
    let login: Login
    let id: Int
    let nodeID: OwnerNodeID
    let avatarURL: String
    let gravatarID: String
    let url, htmlURL, followersURL: String
    let followingURL: FollowingURL
    let gistsURL: GistsURL
    let starredURL: StarredURL
    let subscriptionsURL, organizationsURL, reposURL: String
    let eventsURL: EventsURL
    let receivedEventsURL: String
    let type: TypeEnum
    let siteAdmin: Bool
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
}

enum EventsURL: String, Codable {
    case httpsAPIGithubCOMUsersMojaGlobalEventsPrivacy = "https://api.github.com/users/moja-global/events{/privacy}"
}

enum FollowingURL: String, Codable {
    case httpsAPIGithubCOMUsersMojaGlobalFollowingOtherUser = "https://api.github.com/users/moja-global/following{/other_user}"
}

enum GistsURL: String, Codable {
    case httpsAPIGithubCOMUsersMojaGlobalGistsGistID = "https://api.github.com/users/moja-global/gists{/gist_id}"
}

enum Login: String, Codable {
    case mojaGlobal = "moja-global"
}

enum OwnerNodeID: String, Codable {
    case mdEyOk9YZ2FuaXphdGlvbjE5NTY0OTY5 = "MDEyOk9yZ2FuaXphdGlvbjE5NTY0OTY5"
}

enum StarredURL: String, Codable {
    case httpsAPIGithubCOMUsersMojaGlobalStarredOwnerRepo = "https://api.github.com/users/moja-global/starred{/owner}{/repo}"
}

enum TypeEnum: String, Codable {
    case organization = "Organization"
}

enum Visibility: String, Codable {
    case visibilityPublic = "public"
}

typealias Result = [ResultElement]

// MARK: - Encode/decode helpers

class JSONNull: Codable {
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
