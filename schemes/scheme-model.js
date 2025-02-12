const db = require('../data/db-config.js');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}

function find(){
    return db('schemes');
}

function findById(id){
    return db('schemes').where({ id }).first();
}
// SELECT steps.id
//     , schemes.scheme_name
//     , steps.step_number
//     , steps.instructions
// FROM steps
// Join schemes on steps.scheme_id = schemes.id;


function findSteps(id){
    return db('steps')
        .select('steps.id', 'schemes.scheme_name', 'steps.step_number', 'steps.instructions')
        .join('schemes', 'steps.scheme_id', 'schemes.id')
        .where({
            scheme_id: id
        })
}

function add(newScheme){
    return db('schemes')
        .insert(newScheme, "id")
        .then(ids => {
            const [id] = ids;

            return findById(id)
        })
};

function update(change, id){
    return db('schemes')
        .where({ id })
        .update(change, id)
        .then(count => {
            if(count === 1){
                return change
            } else {
                return null
            }
        })
};

function remove(id){
    return db('schemes')
        .where('id', Number(id))
        .first()
        .then(schemes => {
            if(!schemes){
                return null
            } else {
                return db('schemes')
                    .where({ id })
                    .del()
                    .then(() => {
                        return schemes;
                    })
            }
        })
}
