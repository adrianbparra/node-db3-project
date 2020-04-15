const db = require("../data/db-config.js");

function find(){

    return db("schemes")
}

function add(schemeData){
    return db("schemes").insert(schemeData).then(ids => {
        const id = ids[0]
        return findById(id)
    })
}

function findById(id){

    return db("schemes").where({id}).first()

}

function findSteps(id){

    return db("schemes")
    .join("steps", "schemes.id","steps.scheme_id")
    .select("steps.id", "scheme_name", "steps.step_number", "steps.instructions")
    .where({scheme_id: id})
    .orderBy("steps.step_number")
}


function addStep(stepData, id) {
    return db("steps").insert({...stepData, "scheme_id" : id})
}


function update(changes, id) {
    return db("schemes").where({id}).first().update(changes)
        .then(count => findById(id))
}


function remove(id) {
    return db("schemes").where({id}).first().del()
}


module.exports = {
    find,
    findById,
    add,
    findSteps,
    addStep,
    update,
    remove
};