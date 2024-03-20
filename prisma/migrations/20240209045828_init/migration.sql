-- CreateTable
CREATE TABLE "User" (
    "UserID" INTEGER NOT NULL,
    "UserName" TEXT NOT NULL,
    "UserIcon" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL,
    "Update_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("UserID")
);

-- CreateTable
CREATE TABLE "Issue" (
    "IssueID" INTEGER NOT NULL,
    "IssueName" TEXT NOT NULL,
    "IsuueDetail" TEXT,
    "Visibility" BOOLEAN NOT NULL,
    "PostUserID" INTEGER NOT NULL,
    "explanation" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL,
    "Update_at" TIMESTAMP(3) NOT NULL,
    "OrganisationID" INTEGER NOT NULL,

    CONSTRAINT "Issue_pkey" PRIMARY KEY ("IssueID")
);

-- CreateTable
CREATE TABLE "Option" (
    "OptionID" INTEGER NOT NULL,
    "Option1" TEXT,
    "Option2" TEXT,
    "Option3" TEXT,
    "Option4" TEXT,
    "CorrectOption" INTEGER NOT NULL,

    CONSTRAINT "Option_pkey" PRIMARY KEY ("OptionID")
);

-- CreateTable
CREATE TABLE "Article" (
    "ArticleID" INTEGER NOT NULL,
    "ArticleTitle" TEXT NOT NULL,
    "ArticleLink" TEXT,
    "ArticleUserName" TEXT NOT NULL,

    CONSTRAINT "Article_pkey" PRIMARY KEY ("ArticleID")
);

-- CreateTable
CREATE TABLE "Answer" (
    "AnswerID" INTEGER NOT NULL,
    "Decision" BOOLEAN NOT NULL,
    "IssueID" INTEGER NOT NULL,
    "AnserUserID" INTEGER NOT NULL,
    "selectOptionID" INTEGER NOT NULL,

    CONSTRAINT "Answer_pkey" PRIMARY KEY ("AnswerID")
);

-- CreateTable
CREATE TABLE "Organisation" (
    "OrganisationID" INTEGER NOT NULL,
    "OrganisationName" TEXT NOT NULL,
    "discruption" TEXT,
    "authority" TEXT,
    "UserID" INTEGER NOT NULL,
    "ArticleID" INTEGER NOT NULL,

    CONSTRAINT "Organisation_pkey" PRIMARY KEY ("OrganisationID")
);

-- CreateTable
CREATE TABLE "Tag" (
    "TagID" INTEGER NOT NULL,
    "tagName" TEXT NOT NULL,

    CONSTRAINT "Tag_pkey" PRIMARY KEY ("TagID")
);

-- CreateTable
CREATE TABLE "UserTag" (
    "UserTagID" INTEGER NOT NULL,
    "UserID" INTEGER NOT NULL,
    "TagID" INTEGER NOT NULL,

    CONSTRAINT "UserTag_pkey" PRIMARY KEY ("UserTagID")
);

-- CreateTable
CREATE TABLE "ArticleTag" (
    "ArticleTagID" INTEGER NOT NULL,
    "ArticleID" INTEGER NOT NULL,
    "TagID" INTEGER NOT NULL,

    CONSTRAINT "ArticleTag_pkey" PRIMARY KEY ("ArticleTagID")
);

-- CreateTable
CREATE TABLE "IssueTag" (
    "IssueTagID" INTEGER NOT NULL,
    "IssueID" INTEGER NOT NULL,
    "TagID" INTEGER NOT NULL,

    CONSTRAINT "IssueTag_pkey" PRIMARY KEY ("IssueTagID")
);
