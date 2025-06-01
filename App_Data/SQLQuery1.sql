-- Optional: Drop the existing FeedbackID column if it’s not IDENTITY (skip if it's already auto-increment)
-- ALTER TABLE Feedback DROP COLUMN FeedbackID;

-- Drop and recreate Feedback table (backup if needed first)
DROP TABLE IF EXISTS Feedback;

CREATE TABLE Feedback (
    FeedbackID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    DateCreated DATETIME NOT NULL,
    Status NVARCHAR(50) NOT NULL,
    Message NVARCHAR(MAX) NOT NULL,
    IsTestimonial BIT NOT NULL
);