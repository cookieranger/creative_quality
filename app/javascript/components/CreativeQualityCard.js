import React, { Component } from "react";
import collaborationPng from "images/qualityIcons/collaboration.png";
import empowermentPng from "images/qualityIcons/empowerment.png";
import purposePng from "images/qualityIcons/purpose.png";
const IMAGE_DICTIONARY = {
  Collaboration: collaborationPng,
  Empowerment: empowermentPng,
  Purpose: purposePng
};

const Truncator = ({ text, isTruncating }) => {
  return isTruncating ? (
    <React.Fragment>
      {text.slice(0, 120)}}
      {text.length > 120 ? "..." : ""}
    </React.Fragment>
  ) : (
    text
  );
};

const ProgressBar = ({ color, score }) => (
  <div className="progress-wrapper relative" style={{ width: "50%" }}>
    <div
      className="border-dashed"
      style={{
        position: "absolute",
        top: -13,
        left: "100%",
        marginLeft: -1,
        height: 30,
        width: 2
      }}
    />
    <div
      style={{
        margin: "20px 0",
        marginLeft: `${score > 0 ? 100 : 100 + score}%`,
        height: 4,
        background: color,
        width: Math.abs(score) + "%"
      }}
    />
  </div>
);

const CreativeQualityCard = class extends React.Component {
  constructor(props) {
    super(props);
    this.state = { isReadingMore: false };
  }

  render() {
    const { creativeQuality } = this.props;
    const { isReadingMore } = this.state;
    return (
      <div className="col-md-4">
        <div
          className="panel panel-default center light-shadow"
          style={{
            borderColor: creativeQuality.color,
            borderWidth: 3
          }}
        >
          <div
            className="panel-heading color-white large-text"
            style={{ background: creativeQuality.color }}
          >
            {creativeQuality.name}
          </div>

          <div className="panel-body">
            <div>
              <img
                style={{ width: 120 }}
                src={IMAGE_DICTIONARY[creativeQuality.name]}
              />
            </div>
            <p>
              <strong className="small-text">Your Score: </strong>
            </p>
            <p className="jumbo-text bold">{creativeQuality.final_score}</p>

            <ProgressBar
              color={creativeQuality.color}
              score={creativeQuality.final_score}
            />

            <p className="left-align">
              <Truncator
                text={creativeQuality.description}
                isTruncating={!isReadingMore}
              />
            </p>
            <div>
              <a
                onClick={() => this.setState({ isReadingMore: !isReadingMore })}
              >
                {isReadingMore ? "read less" : "read more"}
              </a>
            </div>
          </div>
        </div>
      </div>
    );
  }
};
export default CreativeQualityCard;
