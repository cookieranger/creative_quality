import React, { Component } from "react";

class App extends Component {
  render() {
    return (
      <div>
        <div className="row">
          <div className="col-md-12">
            <h2 className="center uppercase bold" style={{ marginBottom: 20 }}>
              Creative Qualities
            </h2>
          </div>
        </div>

        <div className="row">
          <div className="col-md-12">
            <div className="row">
              {window.qualsJSON.map(creativeQuality => (
                <CreativeQualityCard
                  creativeQuality={creativeQuality}
                  key={creativeQuality.id}
                />
              ))}
            </div>
          </div>
        </div>
      </div>
    );
  }
}

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
                src={`images/qualityIcons/${creativeQuality.name.toLowerCase()}.png`}
              />
            </div>
            <p>
              <strong className="small-text">Your Score: </strong>
            </p>
            <p className="jumbo-text bold">{creativeQuality.final_score}</p>

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
                  marginLeft: `${
                    creativeQuality.final_score > 0
                      ? 100
                      : 100 + creativeQuality.final_score
                  }%`,
                  height: 4,
                  background: creativeQuality.color,
                  width: Math.abs(creativeQuality.final_score) + "%"
                }}
              />
            </div>
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

export default App;
